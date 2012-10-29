
/// Callback type for when the value is changed
typedef void StateEvent(String values);

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

  static const String _depthStateEnabledId = '#depth_state_enabled';
  static const String _depthStateWriteEnabledId = '#depth_write_enabled';
  static const String _depthStateComparisonId = '#depth_comparison';

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
  /// Whether the depth state is enabled.
  InputElement _depthStateEnabledElement;
  /// Whether writing to the depth buffer is enabled.
  InputElement _depthStateWriteEnabledElement;
  /// Comparison operation for the depth buffer.
  SelectElement _depthStateComparisonElement;

  //---------------------------------------------------------------------
  // Blend state member variables
  //---------------------------------------------------------------------

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

    // Setup the depth state
    _depthStateEnabledElement = _queryInput(_depthStateEnabledId);
    _depthStateEnabledElement.on.change.add((_) { _onDepthStateChanged(); });

    _depthStateWriteEnabledElement = _queryInput(_depthStateWriteEnabledId);
    _depthStateWriteEnabledElement.on.change.add((_) { _onDepthStateChanged(); });

    _depthStateComparisonElement = _querySelect(_depthStateComparisonId);
    _depthStateComparisonElement.on.change.add((_) { _onDepthStateChanged(); });
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
    if (rasterizerCallback != null)
    {
      String props =
      '''
{
  "cullEnabled": ${_rasterizerStateEnabledElement.checked},
  "cullMode": ${_rasterizerStateCullModeElement.value},
  "cullFrontFace": ${_rasterizerStateFrontFaceElement.value}
}
      ''';

      rasterizerCallback(props);
    }
  }

  /**
   * Callback when the depth state is changed.
   */
  void _onDepthStateChanged()
  {
    if (depthStateCallback != null)
    {
      String props =
      '''
{
  "depthTestEnabled": ${_depthStateEnabledElement.checked},
  "depthWriteEnabled": ${_depthStateWriteEnabledElement.checked},
  "depthComparisonOp": ${_depthStateComparisonElement.value}
}
      ''';

      depthStateCallback(props);
    }
  }

  /**
   * Callback when the blend state is changed.
   */
  void _onBlendStateChanged()
  {
    if (blendStateCallback != null)
    {
      String props =
      '''
{
  "blendEnable": ${_depthStateEnabledElement.checked},
  "blendSourceColorFunc": ${_depthStateWriteEnabledElement.checked},
  "blendDestColorFunc": ${_depthStateComparisonElement.value}
  "blendSourceAlphaFunc": ${_depthStateComparisonElement.value}
  "blendDestAlphaFunc": ${_depthStateComparisonElement.value}
  "blendColorOp": ${_depthStateComparisonElement.value}
  "blendAlphaOp": ${_depthStateComparisonElement.value}
}
      ''';

      blendStateCallback(props);
    }
  }
}
