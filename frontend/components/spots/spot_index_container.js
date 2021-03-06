import { connect } from 'react-redux';
import { fetchSpots } from '../../actions/spot_actions';
import SpotIndex from './spot_index';

const msp = ({ entities, ui }) => ({
  spots: Object.values(entities.spots),
  search: ui.search 
});

const mdp = dispatch => ({
  fetchSpots: () => dispatch(fetchSpots())
});

export default connect(msp, mdp)(SpotIndex);