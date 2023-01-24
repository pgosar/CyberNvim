// Search on enter key event
App = {
  search: function(e) {
    if (e.keyCode == 13) {
      var val = document.getElementById('search-field').value;
      window.open('https://google.com/search?q=' + val);
      document.getElementById('search-field').value = '';
      document.getElementById('search-field').blur();
      document.getElementById('search').style.display = 'none';
    }
  },

  // Get current time and format
  getTime: function() {
    var date = new Date();
    return date.toLocaleString('en-US', {
      hour: 'numeric',
      minute: 'numeric',
      hour12: true
    });
  },

  getWeatherIcon: function(iconCode) {
    var dayNight = iconCode.slice(2, 3);
    console.log(dayNight);
    var code = iconCode.slice(0, 2);
    if (dayNight == 'd') {
      switch (code) {
        case '01':
          return 'icons/sunny.png';
        case '02':
          return 'icons/partly_cloudy.png';
        case '03':
          return 'icons/cloudy.png';
        case '04':
          return 'icons/cloudy_s_sunny.png';
        case '09':
          return 'icons/rain_s_cloudy.png';
        case '10':
          return 'icons/rain.png';
        case '11':
          return 'icons/thunderstorms.png';
        case '13':
          return 'icons/snow.png';
        case '50':
          return 'icons/mist.png';
        default:
          return null;
      }
    } else {
      switch (code) {
        case '01':
          return 'icons/night.png';
        case '02':
          return 'icons/night_partly_cloudy.png';
        case '03':
          return 'icons/cloudy.png';
        case '04':
          return 'icons/cloudy_night.png';
        case '09':
          return 'icons/rain_night.png';
        case '10':
          return 'icons/rain.png';
        case '11':
          return 'icons/thunderstorms.png';
        case '13':
          return 'icons/night_snow.png';
        case '50':
          return 'icons/mist.png';
        default:
          return null;
      }
    }
  },

  getWeather: function() {
    let xhr = new XMLHttpRequest();
    /* OPEN WEATHER MAP */
    xhr.open(
      'GET',
      '// your api key'
    );
    xhr.onload = () => {
      if (xhr.readyState === 4) {
        if (xhr.status === 200) {
          let json = JSON.parse(xhr.responseText);
          var temp = ((json.main.feels_like-273.15)*1.8+32).toFixed(0) + '&deg;F';
          var weatherDescription = json.weather[0].description;
          var weatherIcon = App.getWeatherIcon(json.weather[0].icon);
          if (weatherIcon) {
            document.getElementById('weather').innerHTML =
              weatherDescription + ', feels like ' + temp;
            document.getElementById('weather-icon').src = weatherIcon;
          } else {
            document.getElementById('weather').innerHTML =
              weatherDescription + '  ' + temp;
          }
        } else {
          console.log('error msg: ' + xhr.status);
        }
      }
    };

    /* Aus BOM */
    //xhr.open('GET', "https://api.weather.bom.gov.au/v1/locations/r3gx2f/observations");
    //xhr.onload = () => {
    //  if (xhr.readyState === 4) {
    //    if (xhr.status === 200) {
    //      let json = JSON.parse(xhr.responseText);
    //      //var temp = json.main.temp.toFixed(0) + "&deg;C";
    //    } else {
    //      console.log('error msg: ' + xhr.status);
    //    }
    //}
    xhr.send();
  },

  init: function() {
    /* CLOCK */
    document.getElementById('clock').innerHTML = App.getTime();
    setInterval(() => {
      document.getElementById('clock').innerHTML = App.getTime();
    }, 30000);

    /* Weather */
    App.getWeather();

    /* EVENT LISTENERS */
    // search when th enter key is pressed
    var searchField = document.getElementById('search-field');
    searchField.addEventListener('keypress', event => {
      return App.search(event);
    });

    // search field shorcut
    document.addEventListener('keydown', event => {
      if (event.keyCode == 32) {
        // Spacebar code to open search
        document.getElementById('search').style.display = 'flex';
        document.getElementById('search-field').focus();
      } else if (event.keyCode == 27) {
        // Esc to close search
        document.getElementById('search-field').value = '';
        document.getElementById('search-field').blur();
        document.getElementById('search').style.display = 'none';
      }
    });
  }
};

window.onload = App.init();
