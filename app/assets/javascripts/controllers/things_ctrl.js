app.controller('ThingsCtrl', ['Thing', 'action', '$location', function (Thing, action, $location) {
    var ctrl = this;
    action('index', function(){
      ctrl.things = Thing.query();
    });

    action('show', function (params){
      ctrl.thing = Thing.get({id: params.id});
    });

    action('new', function(){
      ctrl.thing = Thing.new();
      ctrl.save = Thing.create;
    });

    action('edit', function (params){
      ctrl.thing = Thing.edit({id: params.id});
      ctrl.save = Thing.update;
    })

    action(['index', 'edit', 'show'], function () {
      ctrl.destroy = function (thing) {
        if (confirm("Вы уверены?"))
          Thing.destroy({id: thing.id}, function () {
            ctrl.things = _.select(ctrl.things, function (_thing) {
              return _thing.id != thing.id
            })
          })
      }
    })

    ctrl.truncate_text = function(description) {
      return description.substring(0, 40) + '...';
    }
  }])