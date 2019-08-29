//= require select2-full


const initSelect2 = () => {
  $('#query').select2({ });
};


const changeSelect2 = () => {
  $('#query').on("change", () => {
    console.log("Chegou aqui");
    // theFetch(search.value);
  });
};

$("#query").on("change", function(e){
    console.log("Chegou aqui");
});



export { changeSelect2, initSelect2 };
