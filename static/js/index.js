var elem = document.querySelector('.collapsible.expandable');
var instance = M.Collapsible.init(elem, {
    accordion: false
});

google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChartLine1);

function drawChartLine1() {
  var data = google.visualization.arrayToDataTable([
    ['Year', 'Free', 'Used', 'Buffers', 'Cached'],
    ['2013',  1000,      400,      2000,      1500],
    ['2014',  1170,      400,      2000,      1500],
    ['2015',  660,       400,      1500,      1500],
    ['2016',  1030,      400,      1000,      1500],
  ]);

  var options = {
    isStacked : true, 
    title: 'Memory Usage',
    hAxis: {title: 'Year',  titleTextStyle: {color: '#333'}},
    vAxis: {minValue: 0}
  };
  var chart = new google.visualization.AreaChart(document.getElementById('chart_divLine'));

  chart.draw(data,options);

}

google.charts.setOnLoadCallback(drawChartLine2);
function drawChartLine2() {
  var data = google.visualization.arrayToDataTable([
    ['Year', ' Load Average' ],
    ['2013',  1000, ],
    ['2014',  1170, ],
    ['2015',  660, ],
    ['2016',  1030, ],
  ]);

  var options = {
    isStacked : true, 
    title: 'Load Average',
    hAxis: {title: 'Year',  titleTextStyle: {color: '#333'}},
    vAxis: {minValue: 0}
  };
  var chart2 = new google.visualization.AreaChart(document.getElementById('chart_divLine2'));

  chart2.draw(data,options);
}

google.charts.setOnLoadCallback(drawChart);
function drawChart() {
  var data = google.visualization.arrayToDataTable([
    ['Task', 'Hours per Day'],
    ['Free',     11],
    ['Use',      25],
  ]);

  var options = {
    title: 'My Daily Activities',
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
        data.addRow([22,'fileSys','mounted','pourcentage','size','used'])

        var table = new google.visualization.Table(document.getElementById('table_div'));

        table.draw(data, {showRowNumber: true, width: '100%', height: '100%'});
      }