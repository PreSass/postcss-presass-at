# Optional at sign
presass_at = postcss.plugin 'presass_at', ->
  return (css, result) ->
    css.eachRule (rule) ->
      selector = rule.selector
      atrules = ['if', 'else', 'function', 'mixin', 'media']

      for atrule in atrules
        if selector.slice(0, atrule.length) == atrule
          rule.selector = '@' + selector

    css.eachDecl (decl) ->
      prop = decl.prop
      atrules = ['return', 'content', 'include', 'extend']

      for atrule in atrules
        if prop == atrule
          decl.prop = '@' + prop
          decl.between = ' '
