<script lang="ts">
  import VisibilityProvider from './providers/VisibilityProvider.svelte';
  import { debugData } from './utils/debugData';
  import Voting from './components/Voting.svelte'
  import DataProvider from './providers/DataProvider.svelte';
  
  debugData([
    {
      action: 'setVisible',
      data: true,
    },
  ]);
</script>

<main>
  <DataProvider />
  <VisibilityProvider>
    <Voting />
  </VisibilityProvider>
</main>

<style>
  main {
    color: white
  }
</style>
