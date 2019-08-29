import 'bootstrap';
// import { initUpdateNavbarOnScroll } from '../components/navbar_home';
// import { initUpdateNavbarOnScroll } from '../components/navbar';
import { showDoctorInfobox } from '../components/doctor-infobox';
import "../plugins/flatpickr";
import { initAutocomplete } from '../plugins/init_autocomplete'
import { changeSelect2, initSelect2 } from '../plugins/select2'

// initUpdateNavbarOnScroll();
initAutocomplete();
changeSelect2();
showDoctorInfobox();
