<template>
  <!-- <HelloWorld /> -->
  <div class="wrapper">
    <Box :data="data"/>
  </div>
</template>

<script>
  import Box from '../components/Box'

  // Service
  import { getData } from '@/services/appService'

  export default {
    components: {
      Box
    },
    data() {
      return {
        data: []
      }
    },
    created() {
      this.data = getData()
    }
  }
</script>

<style media="screen">
    .wrapper {
      margin-top: 80px;
    }
</style>
