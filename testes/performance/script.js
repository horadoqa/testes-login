import http from 'k6/http';
import { sleep } from 'k6';

export const options = {
  vus: 10,
  duration: '30s',
 };

export default function() {
  http.get('https://horadoqa.github.io/testes-login/login/');
  sleep(1);
}
