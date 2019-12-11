<template>
    <div class="map-wrap">
    <div class="row">
        <div class="col-md-2 col-sm-2 col-xs-12">
            <div>
                <a href="#edit-modal-window" class="td__edit"><button class="btn btn-primary">New Zone</button></a>
            </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div>
            <h4 class="text-right custom-padding-top-8">List of Work Zones</h4>
            </div>
        </div>
        <div class="col-md-2 col-sm-4 col-xs-12">
            <div class="select-n-wrap">
                <select id="select-zone" class="form-control custom-select custom-select-lg mb-3" @change="zoneChange">
                    <option class="unselect" value="">All work zones</option>
                    <option v-for="zone in zones"
                        :value="zone.title"
                        :key="zone.id"
                        :data-lat="zone.centerLat"
                        :data-lng="zone.centerLng">
                        {{ zone.name }}</option>
                </select>
            </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div>
            <h4 class="text-right custom-padding-top-8">Supervisors</h4>
            </div>
        </div>
        <div class="col-md-2 col-sm-4 col-xs-12">
            <div class="select-location-wrap">
                <select id="select-location" class="form-control custom-select custom-select-lg mb-3" @change="locationChange">
                    <option value="" class="unselect">All Supervisors</option>
                    <option v-for="supervisor in supervisors"
                        :value="'pin'+supervisor.id"
                        :key="supervisor.id"
                        :data-lat="supervisor.lat"
                        :data-lng="supervisor.lng"
                        :data-name="supervisor.name"
                        :data-phonefirst="supervisor.phone1"
                        :data-phonesecond="supervisor.phone2"
                        :data-email="supervisor.email"
                        :data-address="supervisor.address"
                        class="location-item">
                        {{ supervisor.name }}</option>
                </select>
            </div>
        </div>
        </div>

    <div class="row">
        <div class="col-md-10 col-sm-8 col-xs-12">
            <div id="map-main"></div>
        </div>
        <div class="col-md-2 col-sm-4 col-xs-12">
            <div id="selected-content" class="supervisor-content" v-show="showDetail"> <!-- v-if="showDetail"-->
                <h4 class="supervisor-title">{{ selectedName }}</h4>
                <div class="supervisor-info">
                        <div><strong>Phone:</strong>   {{ selectedPhoneFirst }}<br> {{ selectedPhoneSecond }}</div>
                        <div><strong>Email Address: </strong>{{ selectedEmail }}<br></div>
                        <div><strong>Current address: </strong>{{ selectedAddress }}</div>
                </div>
            </div>
        </div>
    </div>

    </div> <!-- .map-wrap -->
</template>

<script>
import supervisorsFile from '../assets/supervisors.json'
import zonesFile from '../assets/zone.json'

export default {
    data(){
        return{
            map: null,
            marker: null,
            polygon: null,
            supervisors: supervisorsFile,
            zones: zonesFile,
            selectedLat: null,
            selectedLng: null,
            selectedId: null,
            selectedName: null,
            selectedPhoneFirst: null,
            selectedPhoneSecond: null,
            selectedEmail: null,
            selectedAddress: null,
            zoneLat: null,
            zoneLng: null,
            showDetail: false,
            index: null
        }
    },
    methods:{
        mapInit(){
            const myLatLng = {lat: 51.0501100, lng: -114.0852900};

            this.map = new google.maps.Map(document.getElementById('map-main'), {
                zoom: 12,
                center: myLatLng,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            })
        },


        locationChange(event){
            if(event.target.options.selectedIndex === 0){
                this.showDetail = false
            }
            else{
                this.showDetail = true
                const theTarget = event.target.options[event.target.options.selectedIndex].dataset;

                this.selectedLat = parseFloat(theTarget.lat)
                this.selectedLng = parseFloat(theTarget.lng)
                this.selectedName = theTarget.name
                this.selectedPhoneFirst = theTarget.phonefirst
                this.selectedPhoneSecond = theTarget.phonesecond
                this.selectedEmail = theTarget.email
                this.selectedAddress = theTarget.address
            }

            this.map.setCenter({lat: this.selectedLat, lng: this.selectedLng});
            this.map.setZoom(13);
        },

        zoneChange(event){
           if (event.target.options.selectedIndex > -1) {
                const theTarget = event.target.options[event.target.options.selectedIndex].dataset;
                this.zoneLat = parseFloat(theTarget.lat)
                this.zoneLng = parseFloat(theTarget.lng)
            }
            this.map.setCenter({lat: this.zoneLat, lng: this.zoneLng});
            this.map.setZoom(18);
        },


        locationChangeMarker(){
            window.addEventListener('DOMContentLoaded', function(){
                document.getElementById('select-location').onchange = function() {
                    const targetValue = document.getElementById('select-location');
                    const value = targetValue[targetValue.selectedIndex].value;
                    this.selectedId = value

                    console.log(this.selectedId)
                    let currentPinN = document.querySelectorAll('[title="'+ this.selectedId + '"]')[0]

                    currentPinN.className = 'active-pin'
                    currentPinN.getElementsByTagName('img')[0].src=require('../assets/pin-active.svg');
                }
            });

        }
    },

    mounted(){
        this.mapInit();

        this.supervisors.forEach((coord) => {
            const position = new google.maps.LatLng(coord.lat, coord.lng);
            const titleId = coord.id;
            const marker = new google.maps.Marker({
                position,
                title: 'pin' + titleId.toString(),
                icon: {url: require('../assets/pin.svg')},
                map: this.map
            });



            const that = this
            google.maps.event.addListener(marker, 'click', function(event) {
                console.log(marker.title);
                let latLng = marker.getPosition();
                let markerTitle = marker.title
                this.map.setCenter(latLng);
                this.map.setZoom(16);

                that.showDetail = true
                const thePinTarget = document.querySelectorAll('[value="'+ markerTitle + '"]')[0].dataset
                that.selectedName = thePinTarget.name
                that.selectedPhoneFirst = thePinTarget.phonefirst
                that.selectedPhoneSecond = thePinTarget.phonesecond
                that.selectedEmail = thePinTarget.email
                that.selectedAddress = thePinTarget.address

                let elements = document.getElementsByClassName('location-item');
                for (var i = 0; i < elements.length; i++){
                    elements[i].removeAttribute("selected");
                };

                let currentOption = document.querySelectorAll('[value="'+ markerTitle + '"]')[0]
                currentOption.setAttribute("selected", true)


                let currentPin = document.querySelectorAll('[title="'+ markerTitle + '"]')[0]
                currentPin.className = 'active-pin'
                currentPin.getElementsByTagName('img')[0].src=require('../assets/pin-active.svg');
            });

            this.locationChangeMarker()

        });



        this.zones.forEach((zonecoord) => {
            const polygon = new google.maps.Polygon({
                paths: zonecoord.zonePaths,
                strokeColor: '#FF0000',
                strokeOpacity: 0.8,
                strokeWeight: 3,
                fillColor: '#FF0000',
                fillOpacity: 0.35,
                map: this.map
            });
        });

    }
}
</script>

<style scoped>
.map-wrap{
    margin-top: 32px;
}
#map-main{
    width: 100%;
    height: 500px;
}
.active-pin{
    opacity: 1 !important;
}
.active-pin img{
    opacity: 1;
}
</style>
