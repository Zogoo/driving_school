<template>
  <div
    class="fixed-top d-flex align-items-center justify-content-center"
    style="bottom: 0; overflow-y: auto"
  >
    <b-card style="max-width: 400px;">
      <b-form @submit="onSubmit" @reset="onReset" v-if="show">
        <b-form-group
          id="input-user-phone"
          class="mb-0"
          label="Phone number"
          label-for="phone-number"
          description="For example: 99041229"
        >
          <b-form-input
            id="input-phone-number"
            class="mb-2"
            v-model="user.phone"
            placeholder="Enter your phone number"
            aria-describedby="input-live-help input-live-feedback"
            :state="phoneValidation"
            trim
          ></b-form-input>

          <b-form-text id="input-live-help">Your phone number.</b-form-text>

          <!-- This will only be shown if the preceding input has an invalid state -->
          <b-form-invalid-feedback id="input-live-feedback">
            Please enter with following format: 99010101
          </b-form-invalid-feedback>

        </b-form-group>

        <b-form-group id="user-password" label="Password" label-for="password">
          <b-input 
            id="input-user-password" 
            class="mb-2"
            type="password"
            v-model="user.password" 
            aria-describedby="password-help-block password-invalid-feedback"
            :state="passwordValidation"
            trim
          >
          </b-input>

          <b-form-text id="password-help-block">
            4 to 8 character password requiring numbers and both lowercase and uppercase letters
          </b-form-text>

          <b-form-invalid-feedback id="password-invalid-feedback">
            Please enter with following format: Test1
          </b-form-invalid-feedback>
        
        </b-form-group>

        <b-button type="submit" variant="primary">Submit</b-button>
        <b-button type="reset" variant="danger">Reset</b-button>
      </b-form>
    </b-card>
  </div>
</template>

<script>
export default {
  data() {
    return {
      user: {
        phone: '',
        password: ''
      },
      show: true
    }
  },
  computed: {
    phoneValidation() {
      var reg = RegExp('[0-9]{8}');
      return reg.test(this.user.phone);
    },
    passwordValidation() {
      var reg = RegExp('^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{4,8}$');
      return reg.test(this.user.password);
    }
  },
  methods: {
    onSubmit(evt) {
      evt.preventDefault()
      alert(JSON.stringify(this.user))
    },
    onReset(evt) {
      evt.preventDefault()
      // Reset our user values
      this.user.phone = ''
      this.user.password = ''
      // Trick to reset/clear native browser form validation state
      this.show = false
      this.$nextTick(() => {
        this.show = true
      })
    }
  }
}
</script>

<style>
</style>