<script>
  import { useNuiEvent } from "../utils/useNuiEvent";
  import Candidates from '../store/stores'

  useNuiEvent("sendData", (data) => {
    Candidates.set(data)
  });
</script>
