const fetchJSONAndInsert = (docID, row) => {
  fetch(`http://localhost:3000/doctors/${docID}.json`)
    .then(response => response.json())
    .then((data) => {
      const doc = data.doctor;
      insertHTML(row, doc);
  });
}

const insertHTML = (row, doc) => {
  row.insertAdjacentHTML('afterend',
    `<div class="doctor-infobox">\
      <div class="arrow"></div>\
      <div class="doctor-box">\
        <p>${doc.firstName}</p>\
      </div>\
    </div>`
  );
}

const removeInfobox = () => {
  const infobox = document.querySelector('.doctor-infobox');
  if (infobox != null) {
    infobox.remove();
  }
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
