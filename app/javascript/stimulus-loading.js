export function eagerLoadControllersFrom(context) {
    return context.keys().map((key) => context(key).default);
  }
  
  export function definitionsFromContext(context) {
    return context.keys().map((key) => {
      const controller = context(key).default;
      return { identifier: key.replace(/^.*[\\\/]/, "").replace(/\..+$/, ""), controller };
    });
  }
  