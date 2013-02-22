define(function(require, exports, module) {

	var view = require('./view'),
			model = require('./model');

	exports.Controller = {
		routes: {
			'demo': 'demo'
		},

		demo: function () {
			console.log('demo');
			var viewIns = new view.View({
				model: new model.Model()
			});
			$('#demo-box').html(viewIns.render().$el);
		}
	};
});