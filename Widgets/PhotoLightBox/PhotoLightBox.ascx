<%@ Control Language="C#" %>

<div class="gallery-slider">
	<asp:Repeater runat="server" ID="rptLightBox">
		<HeaderTemplate>
			<div class="gallery-slider-large owl-carousel">
			</HeaderTemplate>
			<ItemTemplate>
				<div class="item">
					<img runat="server" id="img" class="lazyOwl" />
					<div class="desc">
						<asp:Literal runat="server" ID="ltlTitle"></asp:Literal>
					</div>
				</div>
			</ItemTemplate>
			<FooterTemplate>
			</div>
		</FooterTemplate>
	</asp:Repeater>

	<asp:Repeater runat="server" ID="rptTmbLightBox">
		<HeaderTemplate>
			<div class="gallery-slider-thumb owl-carousel">
		</HeaderTemplate>
		<ItemTemplate>
			<div class="item">
				<div class="gallery-slider-thumb-item">
					<div class="gallery-slider-thumb-img lazyOwl" id="img" runat="server"></div>
				</div>
			</div>
		</ItemTemplate>
		<FooterTemplate>
			</div>
		</FooterTemplate>
	</asp:Repeater>
</div>