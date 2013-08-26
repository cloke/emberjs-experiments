
Ember.TEMPLATES['components/cml-date'] = Em.Handlebars.compile '
  <label class="control-label" {{bindAttr for=element-id}}>{{_label}}</label>
  <div class="controls">
    <input type="text" /><input type="hidden" {{bindAttr value="view.value"}} />
    {{!input type=text value=value readonly=readonly placeholder=placeholder required=required}}
  </div>
'

CmlDateComponent = CmlTextComponent.extend
  syncDates: ( ->
    if (elm = @$('input[type=text]') ).length && d = @get 'value'
      d = d.split '-'
      elm.val d[1] + '/' + d[2] + '/' + d[0]
  ).observes 'value'

  didInsertElement: ->
    return unless $.datepicker
    @$('input[type=text]').datepicker
      altField:   @$ 'input[type=hidden]'
      format:     'mm/dd/yy'
      altFormat:  'yy-mm-dd'

      onSelect: (dateText, inst) =>
        @set 'value', @$('input[type=hidden]').val()

    @syncDates()

