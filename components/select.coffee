Ember.TEMPLATES['components/cml-select'] = Em.Handlebars.compile '
  <label>{{_label}}</label>
  <div class="controls">
    {{view view.OptionsView}}
  </div>
'

CmlSelectComponent = Ember.Component.extend
  OptionsView: Em.CollectionView.extend
    tagName: 'select'
    valueBinding: 'parentView.value'
    contentBinding: 'parentView.options'

    itemViewClass: Em.View.extend
      attributeBindings: ['value']
      valueBinding: 'content'
      template: Em.Handlebars.compile '
        {{view.content}}
      '
  didInsertElement: ->
    @$('select').val( @get 'value' ) 
  
  valueDidChange: ( ->
    @$('select').val( @get 'value' ) 
  ).observes 'value'

  change: ->
    @set 'value', @$('select').val()