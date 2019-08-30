const bgOrangeToggle = () => {
  const offerBanner = document.querySelector('#banner')
  if (offerBanner !== null) {
    offerBanner.classList.toggle("bg-orange");
  }
}

const bgOrange = () => {
  setInterval(bgOrangeToggle,1000);
}

export { bgOrange };
