const removeInfobox = () => {
  const infobox = document.querySelector('.doctor-infobox');
  if (infobox != null) {
    infobox.remove();
  }
}

const fetchJSONAndInsert = (docID, row) => {
  fetch(`http://localhost:3000/doctors/${docID}.json`)
    .then(response => response.json())
    .then((data) => {
      const doc = data.doctor;
      insertHTML(row, doc);
  });
}

const makeCards = (doc) => {
  let cardsHTML = ""
  doc.offers.forEach((offer) => {
    const date = offer.start_date.replace(/T.*/,"");
    const day = 'Friday';
    const sTime = offer.start_date.replace(/^.*T/,"").replace(/:\d*.\w*\z/,"");
    const eTime = offer.end_date.replace(/^.*T/,"").replace(/:\d*.\w*\z/,"");

    cardsHTML += `<div class="card-flex flex-grow-1">\
          <h5 class="font-black font-bold">\
            ${date} -\
            ${day}\
          </h5>\
          <p>\
            ${sTime} -\
            ${eTime}\
          </p>\
          <a class="btn font-bold" href="/offers/57/consultations">BOOK</a>\
        <p></p>\
      </div>`
    });
  return cardsHTML
}

const makeCalendar = (doc) => {
  if (doc.offers.length > 3){
    return `<a class="card-flex card-full-calendar flex-grow-0" rel="nofollow" data-method="post" href="/doctors/15">
        <h5><i class="fas fa-plus"></i></h5>
        <p>see full calendar</p>
      </a>`
  }
  else {
    return '<div style="padding-left:20px;"></div>'
  }
}


const insertHTML = (row, doc) => {
  let cardsHTML = makeCards(doc);
  row.insertAdjacentHTML('afterend',
    ` <div class="doctor-infobox">
    <div class="arrow"></div>
    <div class="container doctor-box">
      <p class="font-dark-blue font-bold">Following availabilities:</p>
      <div class="row">
          ${cardsHTML}
        ${makeCalendar(doc)}
      </div>
    </div>
  </div>`
  );
}


const showDoctorInfobox = () => {
  const docCards = document.querySelectorAll('.doctor-card');

  docCards.forEach((docCard) => {
    docCard.addEventListener('click', (event) => {
      event.preventDefault();
      removeInfobox();

      const docID = docCard.dataset.id;
      const row = event.currentTarget.parentElement.parentElement
      fetchJSONAndInsert(docID, row);
    });
  });
}



export { showDoctorInfobox };
