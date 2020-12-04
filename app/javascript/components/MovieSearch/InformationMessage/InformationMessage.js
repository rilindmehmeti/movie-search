import React from 'react';

const InformationMessage = (props) => {
  let { message } = props;

  return(
    <div className="information-message-container container">
      <div className="row">
        <div className="col-12">
          <div className="card text-white bg-info">
            <div>{message}</div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default InformationMessage;