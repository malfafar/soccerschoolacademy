//= require blueimp-gallery-all
var ready;
ready = function() {

  blueimp.Gallery(
	    document.getElementById('links'), {
	        onslide: function (index, slide) {
	            var text = this.list[index].getAttribute('datadescription'),
	                node = this.container.find('.description');
	            node.empty();
	            if (text) {
	                node[0].appendChild(document.createTextNode(text));
	            }
	        }
	});

	document.getElementById('links').onclick = function (event) {
	    event = event || window.event;
	    var target = event.target || event.srcElement,
	        link = target.src ? target.parentNode : target,
	        options = {index: link, event: event, onslide: function (index, slide) {
	            var text = this.list[index].getAttribute('datadescription'),
	                node = this.container.find('.description');
	            node.empty();
	            if (text) {
	                node[0].appendChild(document.createTextNode(text));
	            }
	        } },
	        links = this.getElementsByTagName('a');
	    blueimp.Gallery(links, options);
	};

};

$(document).ready(ready);
$(document).on('page:load', ready);
