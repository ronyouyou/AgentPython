document.addEventListener('DOMContentLoaded', function() {
  var elems = document.querySelectorAll('select');
  var instances = M.FormSelect.init(elems);
  });
function goToMachine(){
  var machine = document.getElementById("selectedMachine");
  var machineID = machine.options[machine.selectedIndex].value;
  var base_url = window.location.origin;
  window.location.replace(base_url+"/machine/"+machineID);
}