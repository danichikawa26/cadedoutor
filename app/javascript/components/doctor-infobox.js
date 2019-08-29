const showDoctorInfobox = () => {
  const docCards = document.querySelectorAll('.doctor-card');
  docCards.forEach((docCard) => {
    docCard.addEventListener('click', (event) => {
      event.preventDefault();
      const infobox = document.querySelector('.doctor-infobox');
      if (infobox != null) {
        infobox.remove();
      }

      const row = event.currentTarget.parentElement.parentElement
      row.insertAdjacentHTML('afterend',
        `<div class="doctor-infobox">\
          <div class="arrow"></div>\
          <div class="doctor-box"></div>\
        </div>`
      );
    });
  });
}

export { showDoctorInfobox };
