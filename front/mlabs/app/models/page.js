import DS from 'ember-data';

const { Model } = DS;

export default Model.extend({
  name: DS.attr(),
  url: DS.attr(),
  picture: DS.attr(),
  channel_key: DS.attr()
});
