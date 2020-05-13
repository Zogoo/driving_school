<template>
  <v-app>
    <v-btn>Vuetifyのボタン</v-btn>
    <div>
      <p>{{ message }}</p>
    </div>
  </v-app>
</template>

<script>
export default {
  data() {
    return {
      message: "Hello Vue!"
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
