let userData = {};
const loginParent = () => {
  let email = document.querySelector("#email").value;
  let password = document.querySelector("#password").value;

  var data = `email=${email}&password=${password}`;

  var xhr = new XMLHttpRequest();
  xhr.withCredentials = true;

  xhr.addEventListener("readystatechange", function () {
    if (this.readyState === 4) {
      console.log(document.cookie);
    }
  });

  xhr.open(
    "POST",
    "http://godseye-env.eba-gpcz6ppk.us-east-2.elasticbeanstalk.com/parents/login"
  );

  xhr.send(data);
};
