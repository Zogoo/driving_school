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
      message: "Student"
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
