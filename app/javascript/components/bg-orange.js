const bgOrangeToggle = () => {
  const offerBanner = document.querySelector('#banner')
  offerBanner.classList.toggle("bg-orange");
}

const bgOrange = () => {
  setInterval(bgOrangeToggle,1000);
}

export { bgOrange };
