import 'bootstrap';
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { showDoctorInfobox } from '../components/doctor-infobox';
import "../plugins/flatpickr";
import { initAutocomplete } from '../plugins/init_autocomplete'

initUpdateNavbarOnScroll();
initAutocomplete();
showDoctorInfobox();
