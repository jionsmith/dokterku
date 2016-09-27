# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener "turbolinks:load", () ->

  $ ->
    $(".js-example-basic-multiple").select2({
      placeholder: "Select a departments",
      theme: "classic"
    });

    $('#hospital_opened, #tanggal, #masa_berlaku, #tanggal_akreditasi').datetimepicker({format: 'MMM D, YYYY'});
    $(".multi-select").multiSelect();
    $(".ms-container").append('<i class="glyph-icon icon-exchange"></i>');

    formValidation = (form)->
      valid = 'true'
      $(form).find('input, textarea').each (index, elem) ->
        if($(elem).val() == '' && !$(elem).hasClass('without-valid'))
          $(elem).parent().addClass 'field-error'
          valid = 'false'
        else
          $(elem).parent().removeClass 'field-error'
      $(form).find('select').each (index, elem) ->
        if($(elem).val() == '')
          $(elem).parent().parent().addClass 'field-error'
          valid = 'false'
        else
          $(elem).parent().parent().removeClass 'field-error'
      return valid

    institution_id = () ->
      res = window.location.pathname.match(/^\/institutions\/(\d+)/);
      if (res.length == 2)
        return res[1]

    hospital_id = () ->
      res = window.location.pathname.match(/^\/hospitals\/(\d+)/);
      if (res.length == 2)
        return res[1]

    $("form[name='create-unit-st1']").submit (e) ->
      e.preventDefault()
      user_id = $('#verf_no').data('user-id')
      formData = new FormData($(this)[0])
      $.ajax({
        url: '/inst_verify_request',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        beforeSend: (xhr) =>
          xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
        success: (res) =>
          $('#verify-number-error').text('')
          $('#verify-number-success').text('Your request is accepted')
        error: (data) =>
          $('#verify-number-error').text(data.responseJSON.message)
      })

    $("#institution-profile").submit (e) ->
      e.preventDefault()
      if formValidation($(this)[0]) == 'true'
         formData = new FormData($(this)[0])
         disabled = $("#institution-profile").find(':input:disabled').removeAttr('disabled')
         data = $("#institution-profile").serialize()
         disabled.attr('disabled','disabled')
         $.post('/institutions', data)

    $("#institution-details").submit (e) ->
      e.preventDefault()
      if formValidation($(this)[0]) == 'true'
        formData = new FormData($(this)[0])
        data = $("#institution-details").serialize()
        $.post('/hospitals/' + hospital_id() + '/inst_details', data)

    $("#institution-departments").submit (e) ->
      e.preventDefault()
      data = []
      token = $('input[name="authenticity_token"]').val()
      $('#wrap-inst-departments').find('.ms-selection > ul > .ms-selected').each (index, elem) ->
        dep = $(elem).find('span').text()
        if dep != ''
          data.push(dep)
      $.post('/hospitals/' + hospital_id() + '/departments', {departments: data, authenticity_token: token})


    $('#inst-list').change (e) ->
      window.location.href = '/institutions/' + $(this).val()

    $('#get_verf_no').on 'click', () ->
      user_id = $('#verf_no').data('user-id')
      $.ajax({
        url: '/users/' + user_id + '/check_verify_num?verify_num=' + $('#verf_no').val(),
        type: 'GET',
        contentType: false,
        processData: false,
        beforeSend: (xhr) =>
          xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
        success: (data) =>
        error: () =>
          $('#verify-number-error').text(data.responseJSON.message)
      })

    $('#set_bed').find('input[type="checkbox"]').change ()->
      $input = $(this)
      if $input.is(':checked')
        parent = $input.parents().eq(8)
        $(parent).find('input[type="text"]').removeAttr('disabled')
      else
        $(parent).find('input[type="text"]').attr('disabled', 'disabled')

    $('#create-hospital').click (e)->
      window.location.href = '/hospitals/new'

    $('#create-pharmacy').click (e)->
      window.location.href = '/pharmacies/new'

    $('#create-lab').click (e)->
      window.location.href = '/laboratories/new'

    $('#create-med-vendor').click (e)->
      window.location.href = '/medical_vendors/new'

    $('#create-radiology').click (e)->
      window.location.href = '/radiologies/new'

    $('#create-clinic').click (e)->
      window.location.href = '/clinics/new'

    $('#create-midwife').click (e)->
      window.location.href = '/midwifes/new'

    $('#create-dentist').click (e)->
      window.location.href = '/dentists/new'

    $('#create-other').click (e)->
      window.location.href = '/hospitals/new'

    $('#supplier-db').submit (e) ->
      e.preventDefault()
      $('#result-table').remove()
      $('#supplier-result').parent().removeClass('show')
      supplierCode =$('#supplier-db').find('input[name="supplier_code"]').val()
      supplierName = $('#supplier-db').find('input[name="name"]').val()
      searchType = $('#supplier-db').find('input:checked').val()
      $.ajax({
        url: '/suppliers?name=' + supplierName + '&supplier_code=' + supplierCode  + '&search_type=' + searchType,
        type: 'GET',
        contentType: false,
        processData: false,
        beforeSend: (xhr) =>
          xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
        success: (res) =>
          box = $('#supplier-result')
          content = "<table class='table table-condensed' id='result-table'>" +
                      "<caption>Results</caption>" +
                        "<thead></thead>" +
                          "<tbody>"
          if res.data.length > 0
            res.data.forEach (item) ->
              content = content +  "<tr><td class='col-sm-10'> #{item.name} </td><td><button value=#{item.id} class='btn btn-primary btn-sm add-supplier'>Add</button></td></tr>"
          else
            content = content + "<tr><td>Not found</td></tr>"
          content = content + "<tbody>" + "</table>"    
          $(box).append(content)
          $('.add-supplier').click (e) ->
            e.preventDefault()
            token = $('input[name="authenticity_token"]').val()
            val = $(this).val()
            $.post("/institutions/#{institution_id()}/assign_supplier", {supplier_id: val, authenticity_token: token})
        error: () =>
          
      })

