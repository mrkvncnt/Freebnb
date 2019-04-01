import { connect } from 'react-redux';
import { createBooking } from '../../actions/booking_actions';
import { openModal } from '../../actions/modal_actions';
import BookingForm from './booking_form';

const msp = ({entities, session}) => ({
  currentUser: entities.users[session.id],
  formType: 'Book'
});

const mdp = dispatch => ({
  formAction: booking => dispatch(createBooking(booking)),
  requestLogin: () => dispatch(openModal('LOGIN')),
  confirmBooking: () => dispatch(openModal('BOOK'))
});

export default connect(msp, mdp)(BookingForm);