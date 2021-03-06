<!DOCTYPE html>
<html>
<head>
  <title>Lightspeed Systems - Web Access</title>
  <meta content="authenticity_token" name="csrf-param" />
<meta content="9LzXHUA8vQ4IOnvL4Mn1G9wzZR+eLcSFGVL9v2Ryam8=" name="csrf-token" />
  <meta name="viewport" content="width = device-width, initial-scale = 1.0, user-scalable = yes">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link rel="icon" type="image/png" href="/assets/favicon_16x16.png">
  <link href="http://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
  <link href="/assets/access-4267f759a21388b4e985213714c4ea11.css" media="screen" rel="stylesheet" type="text/css" />
  <script src="/assets/access_default-dc92cd2f6051d9ef70e913c7aedc748a.js" type="text/javascript"></script>
  <script type="text/javascript">
    I18n.defaultLocale = "en";
    I18n.locale = navigator.language || navigator.userLanguage;
    I18n.fallbacks = true;
  </script>

  <script src="/access/web/data.js?1432148281"></script>

  <script>loadRedirInfo();</script>

  <style>
    .hidden { display: none; }

      div.entry {
      text-align:left;
      margin-bottom:15px;
    }
    div.entry input {
      width:200px;
      font-size:12px;
      padding:7px;
      border:1px solid #666;
    }
    div.entry textarea {
      height:150px;
      width:200px;
      font-size:12px;
      padding:7px;
      margin:0;
      resize:none;
    }
    div.entry p {
      text-align:left;
    }

    #submit_for_review_dialog {
      display: none;
    }

  </style>
</head>

<body class="access default" style="overflow:hidden;">
  <div id="header">
    <div id="auth_info" class="hidden"></div>

    <h1 class="custom-title hidden"></h1>
  </div>

  <div class="header-image hidden"></div>

  <div id="stage">
    <div class="message dead_end">
      <div id="column_container">
        <noscript>
          <div id="site_not_accessible" class="col single"></div>
        </noscript>
      </div>

      <div id="submit_for_review_dialog">
        <form accept-charset="UTF-8" action="/access/web/review.js" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="9LzXHUA8vQ4IOnvL4Mn1G9wzZR+eLcSFGVL9v2Ryam8=" /></div>
          <div class="errors"></div>

          <input id="review_submission_require_review_reason" name="review_submission[require_review_reason]" type="hidden" value="false" />
          <input id="redir" name="redir" type="hidden" value="" />

          <div class="entry">
            <p>Email Address<span class="optional-text"> (optional)</span>:</p>
            <input id="review_submission_email" name="review_submission[email]" size="30" type="text" />
          </div>

          <div class="entry">
            <p>Reason for review<span class="optional-text"> (optional)</span>:</p>
            <textarea cols="40" id="review_submission_reason" name="review_submission[reason]" rows="20">
</textarea>
          </div>
</form>      </div>
    </div>
  </div>

  <div class="custom-text hidden"></div>

  <div class="footer-custom" id="footer-custom"></div>

  <div id="footer" class="showcase">
    <!--<a id="logo" href="http://lightspeedsystems.com" target="_blank">
      <span class="icon"></span>
      <span class="name"></span>
    </a>-->

    <!--<a href="#" id="big_campus_ad"></a>

    <div id="details">
      <div class="ad">
        <a href="http://www.lightspeedsystems.com/landingpage/overblocked" target="_blank">
          <img src="/assets/access/ad_big_campus.png" alt="" border="0" />
        </a>
      </div>
    </div>-->
  </div>

  <input id="ad-state" type="hidden" />
  <div id="review_modal" class="modal"></div>
</body>
</html>
