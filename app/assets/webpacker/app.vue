<template>
  <div id="app">
    <google-map />
  </div>
</template>



<script>
import GoogleMap from './packs/GoogleMap.vue'


export default {
  name: 'app',
  components: {
    GoogleMap,

  }
}
</script>

<style>
#map-main {
    height: 70vh;
  }
  .right-panel{
    display: none;
  }
  .right-panel.active{
    display: block;
  }
  .active-pin {
    opacity: 1 !important;
  }
  .modal-window {
    display: none;
    position: fixed;
    z-index: 9999;
    left: 0;
    top: 0;
    overflow: auto;
    width: 100%;
    height: 100%;
    background-color: rgba(255, 255, 255, 1);
    padding: 30px;
  }
  .modal-wrap {
    margin: 0 auto;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 100%;
  }
  #map{
    height: 70vh;
  }
  #pac-input{
    left: 25% !important;
    width: 50% !important;
    top: 8px !important;
  }
  .address-result-wrap{
      padding: 16px 0;
  }
  .address-result{
      font-weight: 700;
  }
  .edit-modal-window{
  display: none;
  position: fixed;
  z-index: 99;
  left: 0;
  top: 0;
  overflow: auto;
  width: 100%;
  height: 100%;
  background: #F2F3F8;
  padding: 30px;
}
.new_work_zone{
  position: relative!important;
  background: #fff!important;
  margin: 10vh auto 0 auto!important;
  padding: 24px!important;
  max-width: 450px!important;
}
.new_work_zone {
    display: block;
}
</style>
