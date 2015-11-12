//Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(".chosen-select").chosen({
  no_results_text: "Oops, nothing found!",
  disable_search_threshold: 5,
  search_contains: true
});
$(".chosen-select").trigger("chosen:updated");
