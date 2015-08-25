# Optional at sign
presass_at = postcss.plugin 'presass_at', ->
  return (css, result) ->
    css.eachRule (rule) ->
      selector = rule.selector
      atrules = ['if', 'else', 'function', 'mixin', 'media', 'include']

      for atrule in atrules
        if selector.slice(0, atrule.length) == atrule
          if atrule == 'include' # Include with content
            if selector.indexOf(':') != -1 # With semicolon
              rule.selector = '@include' + selector.slice(8)
            else # Without semicolon
              rule.selector = '@include' + selector.slice(7)
          else
            rule.selector = '@' + selector

    css.eachDecl (decl) ->
      prop = decl.prop
      atrules = ['return', 'content', 'include', 'extend']

      for atrule in atrules
        if prop == atrule
          decl.prop = '@' + prop
          decl.between = ' '
