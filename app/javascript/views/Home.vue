<template>
  <v-app>
    <div>
      <v-btn>Vuetifyのボタン</v-btn>
      <p>{{ message }}</p>
    </div>
  </v-app>
</template>

<script>
export default {
  data() {
    return {
      message: "Hello Vue!, This is the home"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
