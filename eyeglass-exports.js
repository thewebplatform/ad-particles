var atomicDesignParticles = require("./index");

module.exports = function(eyeglass, sass) {
  return {
    sassDir: atomicDesignParticles.includePaths[0]
  };
};
