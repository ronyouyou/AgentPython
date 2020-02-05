var elem = document.querySelector('.collapsible.expandable');
  var instance = M.Collapsible.init(elem, {
      accordion: false
});
fetch('/machine/3/getInfos')
.then(response => response.json())
.then(data => {
  console.log(data) 
})
.catch(error => console.error(error))
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChartLine1);
function drawChartLine1() {
  var data = google.visualization.arrayToDataTable([
    ['Total', 'Free', 'Used', 'Buffers', 'Cached'],
    [parseInt(memory[2]),parseInt(memory[3]),parseInt(memory[4]),parseInt(memory[0]),parseInt(memory[1])],
  ]);

  var options = {
    isStacked : true, 
    title: 'Memory Usage',
    hAxis: {title: 'Memory',  titleTextStyle: {color: '#333'}},
    vAxis: {minValue: 0}
  };
  var chart = new google.visualization.AreaChart(document.getElementById('chart_divLine'));
  chart.draw(data,options);
}
google.charts.setOnLoadCallback(drawChart);
function drawChart() {
  var free= parseInt(cpu[2]-cpu[1]);
  var used = parseInt(cpu[1]);
  var data = google.visualization.arrayToDataTable([
    ['CPU', 'PERCENT'],
    ['Free',free*100],
    ['Used',used*100],
  ]);

  var options = {
    title: 'CPU USAGE',
    pieHole: 0.4,
  };

  var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
  chart.draw(data, options);
}

google.charts.load('current', {'packages':['table']});
      google.charts.setOnLoadCallback(drawTable);

function drawTable() {
  var data = new google.visualization.DataTable();
  data.addColumn('number', 'Available');
  data.addColumn('string', 'File system');
  data.addColumn('string', 'Mounted');
  data.addColumn('string', 'Pourcentage');
  data.addColumn('string', 'Size');
  data.addColumn('string', 'Used');
  data.addRow([parseInt(disk[2]),parseInt(disk[0]),parseInt(disk[5]),parseInt(disk[1]),parseInt(disk[4]),parseInt(disk[3])])

  var table = new google.visualization.Table(document.getElementById('table_div'));

  table.draw(data, {width: '100%', height: '100%'});
}

