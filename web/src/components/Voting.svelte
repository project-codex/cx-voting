<script lang="ts">
  import Header from "./Header.svelte";
  import Candidates from "./Candidates.svelte";
  import VotingEnd from "./VotingEnd.svelte";
  import { fade } from "svelte/transition";
  import { fetchNui } from '../utils/fetchNui';
  import { visibility } from '../store/stores';

  let candidateInfo: {name: string, party: string} = {name: '', party: ''};
  let hideCandidates = false;

  const submitBallot = () => {
    hideCandidates = true;
    fetchNui("voting/castVote", {
      vote: candidateInfo
    }).then((res) => {
      if (res.status === "success") {
        setTimeout(() => {
          visibility.set(false)
          fetchNui('hideUI');
        }, 3000)
      } else {
        visibility.set(false)
        fetchNui('hideUI');
      }
    });
  };
</script>

<div class="container" class:newContainer={hideCandidates}>
  {#if !hideCandidates}
    <div>
      <Header />
      <Candidates
        on:pushCandidate={(e) => {
          candidateInfo['name'] = e.detail.name;
          candidateInfo['party'] = e.detail.party;
        }}
      />
      {#if candidateInfo.name.length > 0}
        <div class="submit-button">
          <button on:click={submitBallot}>SUBMIT BALLOT</button>
        </div>
      {/if}
    </div>
  {:else}
    <div transition:fade>
      <VotingEnd />
    </div>
  {/if}
</div>

<style>
  .container {
    width: 500px;
    background-color: #222730;
    margin: 70px auto;
    border-radius: 10px;
    padding-bottom: 50px;
    align-items: center;
  }
  .submit-button {
    float: right;
    overflow: hidden;
    margin-right: 10px;
  }
  button {
    cursor: pointer;
    height: 25px;
    width: 100px;
    border: none;
    background: lightgreen;
    border-radius: 5px;
    font-size: 10px;
  }
  .newContainer {
    border-radius: 0;
  }
</style>
