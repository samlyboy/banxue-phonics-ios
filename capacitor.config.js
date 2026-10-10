/** @type {import('@capacitor/cli').CapacitorConfig} */
const config = {
  appId: 'com.ray.banxuephonics',
  appName: '自然拼读',
  webDir: 'www',
  server: {
    androidScheme: 'https'
  },
  ios: {
    contentInset: 'always',
    deploymentTarget: '14.0',
    orientation: 'default'
  }
};

module.exports = config;
