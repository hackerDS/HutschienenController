var request = require('request');

module.exports = function(hackerDS) {
  var self = this;

  self.init = function() {
    console.log('init HutschienenController');
  }

  hackerDS.on('orangeLightState', function(state){
    request.post('http://hutschienenpi:8080/Hutschiene/OrangeLight?state='+state, function(err){
      if(err) console.log(err);
    });
  })
}
