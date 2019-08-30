const showDoctorInfobox = () => {
  const docCards = document.querySelectorAll('.doctor-card');

  docCards.forEach((docCard) => {
    const pos = docCard.dataset.position
    docCard.addEventListener('click', (event) => {
      event.preventDefault();
      removeInfobox();

      const docID = docCard.dataset.id;
      const row = event.currentTarget.parentElement.parentElement
      fetchJSONAndInsert(docID, row, pos);
      docCard.scrollIntoView({block: "end", behavior: "smooth"});
    });
  });
}


const removeInfobox = () => {
  const infobox = document.querySelector('.doctor-infobox');
  if (infobox != null) {
    infobox.remove();
  }
}


const fetchJSONAndInsert = (docID, row, pos) => {
  fetch(`/doctors/${docID}.json`)
    .then(response => response.json())
    .then((data) => {
      const doc = data.doctor;
      insertHTML(row, doc, pos);
  });
}


const insertHTML = (row, doc, pos) => {
  let cardsHTML = makeCards(doc);
  row.insertAdjacentHTML('afterend',
    ` <div class="doctor-infobox">
      <div class="row info-row">
        <div class="col-3 col-arrow">
          <div class="arrow invisible"></div>
        </div>
        <div class="col-3 col-arrow">
          <div class="arrow invisible"></div>
        </div>
        <div class="col-3 col-arrow">
          <div class="arrow invisible"></div>
        </div>
        <div class="col-3 col-arrow">
          <div class="arrow invisible"></div>
        </div>
      </div>
    <div class="container doctor-box">
      <p class="font-dark-blue font-bold">Following availabilities:</p>
      <div class="row">
          ${cardsHTML}
        <a class="card-flex card-full-calendar flex-grow-0" rel="nofollow" data-method="get" href="/doctors/${doc.id}">
          <h5><i class="fas fa-plus"></i></h5>
          <p>see full calendar and doctor's profile</p>
        </a>
      </div>
    </div>
  </div>`
  );
  arrowPosition(pos);
  const box = document.querySelector('.doctor-box')
  box.scrollIntoView({block: "end", behavior: "smooth"});
}


const makeCards = (doc) => {
  let cardsHTML = ""
  doc.offers.forEach((offer) => {
    const date = offer.start_date.replace(/T.*/,"");
    const day = offer.weekday;
    const sTime = offer.start_date.replace(/^.*T/,"").replace(/:00.000-03:00/,"");
    const eTime = offer.end_date.replace(/^.*T/,"").replace(/:00.000-03:00/,"");

    cardsHTML += `<div class="card-flex flex-grow-1">\
          <h5 class="font-black font-bold">\
            ${date} -\
            ${day}\
          </h5>\
          <p>\
            ${sTime} -\
            ${eTime}\
          </p>\
          <a class="btn font-bold" data-method="post" href="/offers/${offer.id}/consultations">BOOK</a>\
        <p></p>\
      </div>`
    });
  return cardsHTML
}


const arrowPosition = (pos) => {
  const deletedArrow = document.querySelector(`.col-arrow:nth-child(${pos})`);
  deletedArrow.insertAdjacentHTML('afterend',
    `<div class="col-3 col-arrow">
      <div class="arrow"></div>
    </div>`
  );
  deletedArrow.remove();
}

// const makeCalendar = (doc) => {
//   if (doc.offers.length > 2){
//     return `<a class="card-flex card-full-calendar flex-grow-0" rel="nofollow" data-method="get" href="/doctors/${doc.id}">
//         <h5><i class="fas fa-plus"></i></h5>
//         <p>see full calendar and doctor's profile</p>
//       </a>`
//   }
//   else {
//     return '<div style="padding-left:20px;"></div>'
//   }
// }







export { showDoctorInfobox };
