<script>
  import { createEventDispatcher } from 'svelte'
  import Candidates from '../store/stores'

  const dispatch = createEventDispatcher()
</script>

<div class="candidates">
  {#each $Candidates as candidate, id}
    <div class="candidate">
      <div class="candidate-info">
        <p class="candidate-name">{candidate.name}</p>
        <p class="party">{candidate.party}</p>
      </div>
      <input type="radio" name="candidate" on:click={() => { dispatch('pushCandidate', {name: candidate.name, party: candidate.party}) }} >
    </div>
  {/each}
</div>

<style>
  .candidates {
    font-family: Verdana, Geneva1, Tahoma, sans-serif;
    margin: 0 10px;
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  .candidate {
    margin: 5px;
    margin-left: -5;
    width: 100%;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    background-color: #31475e;
    border-radius: 5px;
  }
  .candidate-name {
    padding: 0 10px;
    font-size: 15px;
    margin-block-start: 1em;
    margin-block-end: 0;
    margin-block-start: 0;
    margin-top: 10px;
  }
  input {
    width: 40px;
    height: 40px;
    padding-left: 10px;
  }
  .party {
    margin-block-start: .1em;
    margin-block-end: 1em;
    padding: 0 10px;
    font-size: 10px;
    opacity: .8;
  }
</style>
