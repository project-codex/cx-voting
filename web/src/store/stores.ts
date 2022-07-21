import { writable } from "svelte/store";

const Candidates = writable([
  { name: 'John Doe', party: 'The dont knower party' } // Dummy example
])

export const visibility = writable(false);
export default Candidates