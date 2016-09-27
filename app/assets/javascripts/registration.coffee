document.addEventListener "turbolinks:load", () ->

  $ ->

    $('input[type="checkbox"]').uniform()
    $(".selector").append('<i class="glyph-icon icon-caret-down"></i>')
    $('textarea').val ''

    $(window).load ->
     

    user_id = () ->
      res = window.location.pathname.match(/^\/users\/(\d+)/);
      if (res.length == 2)
        return res[1]


    $("input[name='photo']").change (e) ->
      caption = $(this).val()
      indexStart = caption.lastIndexOf('\\') + 1
      $("#caption-photo").html caption.slice(indexStart)

    $("#skip-photo").on 'click', (e) ->
      window.location.href='/users/' + user_id() + '/set_profile_details'

    $("form[name='uploader-photo']").submit (e) ->
      e.preventDefault()
      formData = new FormData($(this)[0])
      id = user_id()
      $.ajax({
        url: '/users/' + id + '/upload_photo',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        beforeSend: (xhr) =>
          xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
        success: (data) =>
          window.location.href='/users/' + user_id() + '/set_profile_details'
      })

    $("form[name='step3']").submit (e) ->
      e.preventDefault()
      formData = new FormData($(this)[0])
      id = user_id()
      $.ajax({
        url: '/users/' + id + '/sign_up_details',
        type: 'PUT',
        data: formData,
        contentType: false,
        processData: false,
        beforeSend: (xhr) =>
          xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
        success: (data) =>
          $('#tab-step3').addClass('done')
          $('#step3').css('display', 'none')
          $('#step4').css('display', 'block')
          link = $('.breadcrumb > li')
          $('#tab-link3 > a').removeClass('active')
          $('#tab-link4').css('visibility', 'visible')
      })

    $("form[name='step4']").submit (e) ->
      e.preventDefault()
      formData = new FormData($(this)[0])
      id = user_id()
      substance = $('#substance').val().split('\n')
      reaction = $('#reaction').val().split('\n')
      data = []
      if $('#substance').val() != '' && $('#reaction').val() != ''
        substance.forEach (item, index) ->
          data.push({substance: item, reaction: reaction[index]})
      $.ajax({
        url: '/users/' + id + '/add_allergies',
        type: 'POST',
        data: {allergies: JSON.stringify(data)},
        beforeSend: (xhr) =>
          xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
        success: (data) =>
          $('#skip-med-history').css('display', 'none')
          $('#go-set-rel').css('display', 'inline-block')
      })

    $('#skip-step5').on 'click', (e) ->
      window.location.href='/users/' + user_id()

    $("input[name='rm_number']").keydown (e) ->
      text = this;
      run = () ->
        $.ajax({
          url: '/users/relative',
          type: 'GET',
          data: {'rm_number': $(text).val()},
          beforeSend: (xhr) =>
            xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
          success: (res) =>
            if res.status == 0
              $('#family-member').attr('src', res.data.photo_thumb_url)
              $('#notice').css('display', 'inline-block')
              $('#save-relative').attr("disabled", false)
            else
              $('#family-member').attr('src', '')
              $('#notice').css('display', 'none')
              $('#save-relative').attr("disabled", true)
        })

      setTimeout(run, 0)

    $("form[name='step5']").submit (e) ->
      e.preventDefault()
      formData = new FormData($(this)[0])
      id = user_id()
      $.ajax({
        url: '/users/' + id + '/relatives',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        beforeSend: (xhr) =>
          xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
        success: (data) =>
          if data.status == 0
            $('#family-member').attr('src', '')
            $('#notice').css('display', 'none')
            $('#save-relative').attr("disabled", true)
            $("input[name='rm_number']").val('')
            $("#skip-step5").css('display', 'none')
            $("#finish").css('display', 'inline-block')
            template = '<div class="col-lg-12 col-md-12 col-sm-12">' +
              'Relative was added' +
              '</div>'
            $('#family').append(template)
      })

    $('#finish').on 'click', (e) ->
      window.location.href='/users/' + user_id()














