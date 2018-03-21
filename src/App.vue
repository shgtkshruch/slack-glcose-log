<template>
  <div class="app">
    <DatePicker />
    <Meals />
  </div>
</template>

<script>
import Meals from './components/Meals'
import DatePicker from './components/DatePicker'

export default {
  components: {
    Meals,
    DatePicker
  }
}
</script>

<style>
.app {
  max-width: 30rem;
  margin: -1rem 0 0 43%;
  text-align: center;
}
</style>
