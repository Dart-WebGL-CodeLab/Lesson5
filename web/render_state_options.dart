
/// Callback type for when the value is changed
typedef void StateEvent(Map values);

/**
 * UI for changing the state of the renderer.
 */
class RenderStateOptions
{
  //---------------------------------------------------------------------
  // Class constants
  //---------------------------------------------------------------------

  static const String _rasterizerStateEnabledId = '#rasterizer_state_enabled';
  static const String _rasterizerStateCullModeId = '#rasterizer_cull_mode';
  static const String _rasterizerStateFrontFaceId = '#rasterizer_front_face';


  //---------------------------------------------------------------------
  // Rasterizer state member variables
  //---------------------------------------------------------------------

  /// Callback for when the [RasterizerState] changes.
  StateEvent rasterizerCallback;
  /// Whether the rasterizer state is enabled.
  InputElement _rasterizerStateEnabledElement;
  /// Culling mode to use.
  SelectElement _rasterizerStateCullModeElement;
  /// The front face for triangles.
  SelectElement _rasterizerStateFrontFaceElement;

  //---------------------------------------------------------------------
  // Depth state member variables
  //---------------------------------------------------------------------


  /// Callback for when the [DepthState] changes.
  StateEvent depthStateCallback;
  /// Callback for when the [BlendState] changes.
  StateEvent blendStateCallback;

  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  /**
   * Initializes an instance of the [RenderStateOptions] class.
   */
  RenderStateOptions()
  {

    // Setup the rasterizer state
    _rasterizerStateEnabledElement = _queryInput(_rasterizerStateEnabledId);
    _rasterizerStateEnabledElement.on.change.add((_) { _onRasterizerStateChanged(); });

    _rasterizerStateCullModeElement = _querySelect(_rasterizerStateCullModeId);
    _rasterizerStateCullModeElement.on.change.add((_) { _onRasterizerStateChanged(); });

    _rasterizerStateFrontFaceElement = _querySelect(_rasterizerStateFrontFaceId);
    _rasterizerStateFrontFaceElement.on.change.add((_) { _onRasterizerStateChanged(); });
  }

  /**
   * Helper method to query the document for the given [id].
   */
  InputElement _queryInput(id)
  {
    InputElement element = document.query(id) as InputElement;
    assert(element != null);

    return element;
  }

  /**
   * Helper method to query the document for the given [id].
   */
  SelectElement _querySelect(id)
  {
    SelectElement element = document.query(id) as SelectElement;
    assert(element != null);

    return element;
  }
  /**
   * Callback when the rasterizer state is changed.
   */
  void _onRasterizerStateChanged()
  {
    print('Hiiii');
  }

  /**
   * Callback when the depth state is changed.
   */
  void _onDepthStateChanged()
  {

  }

  /**
   * Callback when the blend state is changed.
   */
  void _onBlendStateChanged()
  {

  }
}
