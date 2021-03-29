<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import "compass/css3";

#mainForm {
  padding: 25px !important;
  top: 0 !important;
  width: 400px !important;
  z-index: 0 !important;
}



// ====================================================================
// Forms
// ====================================================================


fieldset {
  border: 0;
  margin: 0;
  padding: 0;
}

legend {
  border: 0;
  border-bottom: 1px solid #e5e5e5;
  color: #333;
  display: block;
  font-size: 21px;
  line-height: 40px;
  margin-bottom: 20px;
  padding: 0;
  width: 100%;
}

input, 
textarea, 
select {
  border: 0 none transparent;
  box-shadow: none;
  font: inherit;
  margin: 0 0 20px;
  padding: 10px 8px;
  position: relative;
  z-index: 0;
}

input {
  transition: border .2s linear 0s, box-shadow .2s linear 0s;
  width: 100%;
  &[type="text"],
  &[type="password"],
  &[type="email"],
  &[type="search"] {
    background-color: #fff;
    border: 0 none;
    box-shadow: none;
    width: 100%;
  }

  &[type="file"] {
    border: 0 none transparent !important;
    height: 40px;
    line-height: 30px;
  }

  &[type="radio"],
  &[type=radio][name="amount"] {
    display: none;
    margin: 12px 0;
  }
  
  &[type="text"]:focus,
  &[type="password"]:focus,
  &[type="datetime"]:focus,
  &[type="datetime-local"]:focus,
  &[type="date"]:focus,
  &[type="month"]:focus,
  &[type="time"]:focus,
  &[type="week"]:focus,
  &[type="number"]:focus,
  &[type="email"]:focus,
  &[type="url"]:focus,
  &[type="search"]:focus,
  &[type="tel"]:focus,
  &[type="color"]:focus {
    border-color: inherit;
    box-shadow: none;
    outline: 0;
  }

  &[type=radio][name="amount"] {
    + label {
      background-color: #f5f5f5;
      border-radius: 2px;
      clear: none;
      color: #333;
      cursor: pointer;
      float: left;
      margin: 2px;
      text-align: center;
      vertical-align: middle;
      width: 100%;
    }
    &:checked + label {
      background-color: #6e526f;
      background-image: none;
      color: #fff !important;
    }
  }
}


select {
  width: 363px;
}

textarea {
  background-color: #fff;
  border: 0 none;
  box-shadow: none;
  width: 100%;
  transition: border .2s linear 0s, box-shadow .2s linear 0s; 

  &:focus {
    border-color: inherit;
    box-shadow: none;
    outline: 0;
  }
}

label {
  cursor: pointer;
  padding: 10px;
  pointer-events: all;
  position: absolute;
  z-index: 1;
  &[for="CVV2"] {
    color: #6d665f !important;
    float: left;
    margin-right: 15px;
    padding: 0;
    position: static;
    visibility: visible !important;
  }

  &[for="ccExpMonth"] {
    color: #6d665f !important;
    float: left;
    margin-right: 15px;
    padding: 0;
    position: static;
    visibility: visible !important;
  }
  &[for="f7"],
  &[for="f9"] {
    display: block;
    height: 0;
    margin: 0;
    padding: 0;
    position: static;
    visibility: hidden;
  }

  &[for="other"] {
    color: #6d665f !important;
    text-indent: 12px;
  }
}






.formRow {
  display: block;
}


#donation_amount {
  & > .formRow {
    float: left;
    height: 50px;
    margin: 0 20px;
    width: 20%;
    position: relative;
    &.otherRow {
      clear: both;
      float: left;
      width: 100%;
      #other + label {
        width: 20%;
        float: left;
        clear: none;
      }
      #otheramt {
        float: right;
        width: 260px;
        margin: 0 0 5px 20px;
      }
    }
  }
}

#emailValidationErrorId {
  background: #f00;
  color: #fff;
  padding: 0 10px;
  position: relative;
  z-index: 1;
}


#ccExpMonth {
  float: left;
  width: inherit;
}

#ccExpYear {
  margin-left: 10px;
  width: auto;
}

#CVV2 {
  width: 100px;
}

#recurrence {
  margin-bottom: 2em;

  .formRow {
    float: left;
    height: 80px;
    position: relative;
    width: 50%;
  }

  input[type=radio] + label {
    &[for="one_time"],
    &[for="recurring"] {
      background-color: #f5f5f5;
      clear: none;
      color: #333;
      cursor: pointer;
      display: block;
      float: left;
      height: 40px;
      margin: -2px;
      margin-bottom: 10px;
      padding: 10px 0;
      text-align: center;
      vertical-align: middle;
      width: 100%;
    }
  }
  label[for="one_time"] {
    line-height: 40px;
  }
  input[type=radio]:checked + label {
    &[for="one_time"],
    &[for="recurring"] {
      background-color: #6e526f;
      background-image: none;
      color: #fff !important;
    }
  }

  #recurring_options .formRow {
    float: none;
    margin: 0;
    width: 50%;
  }
}



</style>
</head>

<body>
<div id="mainForm" class="donation">
  <form action="https://salsa3.salsalabs.com/salsa/shop/processDonate.jsp" method="post" name="subform" class="orderform">
    <div class="memberSignup">
      <input name="first_name_1881" value="">
    </div>
    <input class="field" type="hidden" name="table" value="supporter">
    <input type="hidden" name="redirect" value="http://salsa3.salsalabs.com/o/xxxx/p/salsa/web/thank_you_page/public/thankYou.sjs?thank_you_page_KEY=xxxx">
    <input type="hidden" name="email_trigger_KEYS" value="26417,26695,27193">
    <input type="hidden" name="merchant_account_KEY" value="539" id="merchant_account_KEY">
    <input type="hidden" name="donate_page_KEY" value="9256">
    <input type="hidden" name="Tax_Status" value="C3">
    <input type="hidden" name="Transaction_Type" value="Donation">
    <input type="hidden" name="Tracking_Code" value="CFS page">
    <input type="hidden" name="amountLimit" value="10000.00">
    <input type="hidden" name="amountMinimum" value="2.00">
    <input type="hidden" name="feed_archetype" value="78">
    <div id="left_container">
      <input type="hidden" name="key" value="0">
      <fieldset id="personal_information">
        <legend>Your Information</legend>
        <div class="supporterInfo">
          <input type="hidden" name="table" value="supporter">
          <br>
          <div class="diaFields">
            <input type="hidden" name="key" value="0">
            <div class="clear"></div>
            <div class="formRow">
              <label for="f1">First Name
                <span class="required">*</span>
              </label>
              <input title="First Name" type="text" id="f1" name="First_Name" class="blockInput salsa_first_name" value="" size="25">
            </div>
            <div class="clear"></div>
            <div class="formRow">
              <label for="f2">Last Name
                <span class="required">*</span>
              </label>
              <input title="Last Name" type="text" id="f2" name="Last_Name" class="blockInput salsa_last_name" value="" size="25">
            </div>
            <div class="clear"></div>
            <div class="formRow">
              <label id="label.Street" for="f3">Street
                <span class="required">*</span>
              </label>
              <input title="Street 1" type="text" id="f3" name="Street" class="blockInput salsa_street" value="" size="25">
            </div>
            <div class="clear"></div>
            <div class="formRow">
              <label for="f4">Street 2</label>
              <input title="Street 2" type="text" id="f4" name="Street_2" class="blockInput salsa_street_2" value="" size="25">
            </div>
            <div class="clear"></div>
            <div class="formRow">
              <label for="f5">City
                <span class="required">*</span>
              </label>
              <input title="City" type="text" id="f5" name="City" class="blockInput salsa_city" value="" size="25">
            </div>
            <div class="clear"></div>
            <div class="formRow">
              <label for="f6">State/Province
                <span class="required">*</span>
              </label>
              <span class="stateSelect">
                <select id="f6" name="State" class="state_dropdown blockInput salsa_state">
                  <option value="">Select a state</option>
                  <option value="AL">Alabama</option>
                  <option value="AK">Alaska</option>
                  <option value="AS">American Samoa</option>
                  <option value="AZ">Arizona</option>
                  <option value="AR">Arkansas</option>
                  <option value="CA">California</option>
                  <option value="CO">Colorado</option>
                  <option value="CT">Connecticut</option>
                  <option value="DE">Delaware</option>
                  <option value="DC">D.C.</option>
                  <option value="FL">Florida</option>
                  <option value="GA">Georgia</option>
                  <option value="GU">Guam</option>
                  <option value="HI">Hawaii</option>
                  <option value="ID">Idaho</option>
                  <option value="IL">Illinois</option>
                  <option value="IN">Indiana</option>
                  <option value="IA">Iowa</option>
                  <option value="KS">Kansas</option>
                  <option value="KY">Kentucky</option>
                  <option value="LA">Louisiana</option>
                  <option value="ME">Maine</option>
                  <option value="MD">Maryland</option>
                  <option value="MA">Massachusetts</option>
                  <option value="MI">Michigan</option>
                  <option value="MN">Minnesota</option>
                  <option value="MS">Mississippi</option>
                  <option value="MO">Missouri</option>
                  <option value="MT">Montana</option>
                  <option value="NE">Nebraska</option>
                  <option value="NV">Nevada</option>
                  <option value="NH">New Hampshire</option>
                  <option value="NJ">New Jersey</option>
                  <option value="NM">New Mexico</option>
                  <option value="NY">New York</option>
                  <option value="NC">North Carolina</option>
                  <option value="ND">North Dakota</option>
                  <option value="MP">Northern Mariana Islands</option>
                  <option value="OH">Ohio</option>
                  <option value="OK">Oklahoma</option>
                  <option value="OR">Oregon</option>
                  <option value="PA">Pennsylvania</option>
                  <option value="PR">Puerto Rico</option>
                  <option value="RI">Rhode Island</option>
                  <option value="SC">South Carolina</option>
                  <option value="SD">South Dakota</option>
                  <option value="TN">Tennessee</option>
                  <option value="TX">Texas</option>
                  <option value="UT">Utah</option>
                  <option value="VT">Vermont</option>
                  <option value="VI">Virgin Islands</option>
                  <option value="VA">Virginia</option>
                  <option value="WA">Washington</option>
                  <option value="WV">West Virginia</option>
                  <option value="WI">Wisconsin</option>
                  <option value="WY">Wyoming</option>
                  <option value="AA">Armed Forces (the) Americas</option>
                  <option value="AE">Armed Forces Europe</option>
                  <option value="AP">Armed Forces Pacific</option>
                  <option value="AB">Alberta</option>
                  <option value="BC">British Columbia</option>
                  <option value="MB">Manitoba</option>
                  <option value="NF">Newfoundland</option>
                  <option value="NB">New Brunswick</option>
                  <option value="NS">Nova Scotia</option>
                  <option value="NT">Northwest Territories</option>
                  <option value="NU">Nunavut</option>
                  <option value="ON">Ontario</option>
                  <option value="PE">Prince Edward Island</option>
                  <option value="QC">Quebec</option>
                  <option value="SK">Saskatchewan</option>
                  <option value="YT">Yukon Territory</option>
                  <option value="ot">Other</option>
                </select>
              </span>
            </div>
            <div class="clear"></div>
            <div class="formRow">
              <label for="f7">Zip/Postal Code
                <span class="required">*</span>
              </label>
              <input title="Zip Code" type="text" id="f7" name="Zip" class="blockInput salsa_zip" value="" maxlength="10">
            </div>
            <div class="clear"></div>
            <div class="formRow">
              <label for="f8">Email
                <span class="required">*</span>
              </label>
              <input title="Email" type="text" id="f8" name="Email" class="blockInput salsa_email" value="" onblur="validateEmail(this.value)" size="25">
            </div>
          </div>
          <input type="hidden" name="required" value="Email,First_Name,Last_Name,Street,City,State,Zip,">
        </div>
        <input type="hidden" name="customfields" value="donation">
        <input type="hidden" name="linkRequired" value="">
        <input type="hidden" name="linkRequest" value="">
        <span id="salsaform_0"></span>
      </fieldset>
      <!-- personal_information -->
    </div>
    <!-- left_container -->
    <div id="right_container">
      <fieldset id="donation_amount">
        <legend>Donation Amount</legend>
        <div id="pre_donation_text">
          <p>
            <span style="font-size: small;">
              <span style="font-family: Verdana;">Enter your one-time or monthly donation amount and then choose your credit card type in the dropdown menu</span>
            </span>
          </p>
        </div>
        <!-- pre_donation_text -->
        <div id="recurrence">
          <div class="formRow">
            <input checked="checked" value="0" name="recurring" onclick="checkRecurringOpts()" type="radio" id="one_time">
            <label for="one_time">
              One-time contribution
            </label>
          </div>
          <div class="formRow">
            <input value="1" name="recurring" onclick="checkRecurringOpts()" type="radio" id="recurring">
            <label for="recurring">
              Recurring contribution
              <a href="#" class="link-help" onclick="window.open('help-recurring.html', 'pop1', 'toolbar=no,menubar=no,scrollbars=no,,width=500,height=200')">
                      (what's this?)
                    </a>
            </label>
          </div>
          <span id="recurring_options">
            <span id="salsaform_1">
              <div class="recurring-disclosure">Your recurring donation will be automatically deducted from your account on a monthly basis.</div>
              <input type="hidden" name="TERM" value="9999">
              <input type="hidden" name="PAYPERIOD" value="MONT">
            </span>
          </span>
        </div>
        <!-- recurrence -->
        <div class="formRow">
          <input id="amt35" value="35" name="amount" type="radio" onfocus="clearOther(this.form);">
          <label for="amt35">$35</label>
        </div>
        <div class="formRow">
          <input id="amt 50" value=" 50" name="amount" type="radio" onfocus="clearOther(this.form);">
          <label for="amt 50">$ 50</label>
        </div>
        <div class="formRow">
          <input id="amt 100" value=" 100" name="amount" type="radio" onfocus="clearOther(this.form);">
          <label for="amt 100">$ 100</label>
        </div>
        <div class="clearall"></div>
        <div class="formRow">
          <input id="amt 250" value=" 250" name="amount" type="radio" onfocus="clearOther(this.form);">
          <label for="amt 250">$ 250</label>
        </div>
        <div class="formRow">
          <input id="amt 1000" value=" 1000" name="amount" type="radio" onfocus="clearOther(this.form);">
          <label for="amt 1000">$ 1000</label>
        </div>
        <div class="clearall"></div>
        <div class="formRow otherRow">
          <input id="other" value="" name="amount" type="radio">
          <label for="other">
            other $
          </label>
          <input id="otheramt" name="amountOther" type="text" onfocus="checkOther(this.form);" onblur="trimOther(this.form);" value="">
        </div>
      </fieldset>
      <!-- donation_amount -->
      <div id="useCheck" style="display:none">
        <fieldset id="check_information">
          <legend id="check_information">Check Information</legend>
          <div class="formRow">
            <div class="helpText">Please enter your account number with no spaces or dashes.</div>
            <label>
              Checking Account Number:
            </label>
            <input id="checkingAccountNumber" name="checkingAccountNumber" class="field blockInput" type="text" maxlength="17" value="" autocomplete="off">
          </div>
          <div class="formRow">
            <div class="helpText">Please enter your ABA (Bank Routing) number with no spaces or dashes.</div>
            <label>
              ABA (Bank Routing) Number:
            </label>
            <input id="checkingRoutingNumber" name="checkingRoutingNumber" class="field blockInput" type="text" maxlength="9" value="" autocomplete="off">
          </div>
          <div class="formRow">
            <label><a onclick="return wt2()" href="/salsa/api/shop/check.jpg" target="_blank"> What are these?</a>
            </label>
          </div>
        </fieldset>
      </div>
      <div id="useCC">
        <style>
        </style>
        <fieldset id="credit_card_information">
          <legend>Credit Card Information</legend>
          <div class="formRow">
            <label for="cc_type">Card Type</label>
            <select name="cc_type" class="field blockInput" id="cc_type">
              <option value=""></option>
              <option value="visa">Visa</option>
              <option value="mc">MasterCard</option>
              <option value="amex">American Express</option>
              <option value="disc">Discover</option>
            </select>
          </div>
          <div class="formRow">
            <div class="helpText">Please enter your card number with no spaces or dashes.</div>
            <label for="cc_number">
              Card Number
            </label>
            <input id="cc_number" name="cc" class="field blockInput" type="text" maxlength="16" value="" autocomplete="off">
          </div>
          <div class="formRow">
            <label for="ccExpMonth">Expires</label>
            <div class="blockInput">
              <select name="ccExpMonth" class="field" id="ccExpMonth" autocomplete="off">
                <option value=""></option>
                <option value="01">01</option>
                <option value="02">02</option>
                <option value="03">03</option>
                <option value="04">04</option>
                <option value="05">05</option>
                <option value="06">06</option>
                <option value="07">07</option>
                <option value="08">08</option>
                <option value="09">09</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
              </select>
              <label style="display: none;" for="ccExpYear">Expiration Month</label>
              <select name="ccExpYear" class="field" id="ccExpYear" autocomplete="off">
                <option value=""></option>
                <option value="14">2014</option>
                <option value="15">2015</option>
                <option value="16">2016</option>
                <option value="17">2017</option>
                <option value="18">2018</option>
                <option value="19">2019</option>
                <option value="20">2020</option>
                <option value="21">2021</option>
                <option value="22">2022</option>
                <option value="23">2023</option>
                <option value="24">2024</option>
                <option value="25">2025</option>
                <option value="26">2026</option>
                <option value="27">2027</option>
                <option value="28">2028</option>
                <option value="29">2029</option>
              </select>
            </div>
          </div>
          <div class="formRow">
            <label for="CVV2">
              Security Code
              <a onclick="return wt()" href="/salsa/api/shop/cvv2.jsp" target="_blank"> (What's this?)</a>
            </label>
            <input class="input3" maxlength="4" size="3" name="CVV2" id="CVV2" autocomplete="off">
          </div>
        </fieldset>
        <!-- credit_card_information -->
      </div>
      <input type="hidden" name="eligibility" value="1">
    </div>
    <!-- right_container -->
    <input type="hidden" name="organization_KEY" value="1881">
    <input type="hidden" name="link" value="groups">
    <input type="hidden" name="linkKey" value="0">
    <input type="hidden" name="link" value="groups">
    <input type="hidden" name="linkKey" value="101836">
    <input type="hidden" name="link" value="groups">
    <input type="hidden" name="linkKey" value="">
    <input type="hidden" name="updateRowValues" value="true">
    <div class="clear"></div>
    <div id="submit">
      <input id="submitContribution" type="submit" alt="Submit Contribution" class="submit" value="Submit">
      <p>Please click the submit button only once.</p>
    </div>
  </form>
</div>
</body>
</html>