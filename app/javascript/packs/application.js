import 'bootstrap';
import { initUpdateNavbarOnScroll } from '../components/navbar';
import "../plugins/flatpickr";
import { initAutocomplete } from '../plugins/init_autocomplete'
import { changeSelect2, initSelect2 } from '../plugins/select2'

initUpdateNavbarOnScroll();
initAutocomplete();
changeSelect2();
