import React from 'react';
import { connect } from 'react-redux';
import { closeModal } from '../../actions/modal_actions';
import LoginContainer from '../session/login_container';
import SignupContainer from '../session/signup_container';

const Modal = ({modal, closeModal}) => {

  if (!modal) {
    return null;
  }

  let form;
  switch (modal) {
    case 'SIGNUP': {
      form = <SignupContainer />;
      break;
    }
    case 'LOGIN': {
      form = <LoginContainer />;
      break;
    }
    default: return null;
  } 

  return (
    <div className="modal-background" onClick={closeModal}>
      <div className="modal-child" onClick={e => e.stopPropagation()}>
        {form}
      </div>
    </div>
  )

}

const msp = state => ({
  modal: state.ui.modal
})

const mdp = dispatch => ({
  closeModal: () => dispatch(closeModal())
})

export default connect(msp, mdp)(Modal)