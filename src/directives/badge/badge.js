import Badge from '../../components/badge';
import {Util, Dom} from '../../helper';

export default {
    bind (element, data, VNode) {
        let instance = element.$$badge = Util.factory(Badge, {
            text: data.value.text || data.value,
            color: data.value.color
        }, element);

        let el = instance.$el;

        if (!/fixed|absolute/.test(Dom.css(element, 'position'))) {
            Dom.css(element, 'position', 'relative');
        }

        Dom.css(el, {
            position: 'absolute', 
            top: 0,
            right: 0,
            transform: 'translate(50%, -50%) scale(0.5)'
        });
    },

    update (element, data) {
        element.$$badge.setText(data.value);
    },

    name: 'badge',

    Component: Badge
};