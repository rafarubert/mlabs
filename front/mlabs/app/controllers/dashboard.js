import Controller from '@ember/controller';

import { storageFor } from 'ember-local-storage';

export default Controller.extend({
  isShowingModal: false,
  channel: '',
  selectedName: '',
  selectedChannels: storageFor('my-channels'),
  actions: {
    openSetup: function( channel ) {
      this.set('isShowingModal', true);
      this.set('channel', channel);
    },
    closeSetup: function( ){
      this.set('isShowingModal', false);
      this.set('channel', '');
    },
    clickSelected: function( value ){
      this.set("selectedName", value);      
    },
    addChannels: function( ){
      this.set('isShowingModal', false);
      this.get('selectedChannels').pushObject({
        name: this.get('selectedName'),
        channel: this.get('channel')
      });
    }
  }
});