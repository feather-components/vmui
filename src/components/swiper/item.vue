<template>
    <div class="vm-swiper-item">
        <slot></slot>
    </div>
</template>

<script>
import {Event, Dom} from '../../helper';

export default {
    name: 'swiper-item',

    mounted () {
        Event.on(window, 'resize', () => this.resize());
        this.resize();
    },

    methods: {
        resize () {
            this.$el.style.width = Dom.width(document) + 'px';

            if (this.$parent.axis == 'y') {
                this.$el.style.height = Dom.height(document) + 'px';
            }
        }
    }
};
</script>

<style>
.vm-swiper-item {
    overflow: hidden;
}
</style>