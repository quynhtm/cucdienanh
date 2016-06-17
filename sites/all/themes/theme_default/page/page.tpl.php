<div id="wrapper">
	<?php if ($page['header']){ ?>
	<div id="header">
		<?php echo render($page['header']); ?>
	</div>
	<?php } ?>
	<div id="content">
		<div class="wrapper-content">
			<div class="wrapp" <?php if ($page['left'] && $page['right']){ ?>id="wrapper-c"<?php }elseif($page['left'] && !$page['right']){?>id="wrapper-l"<?php }elseif(!$page['left'] && $page['right']){?>id="wrapper-r"<?php }elseif(!$page['left'] && !$page['right']){?>id="wrapper-cc"<?php }else{ ?>id="wrapper-f"<?php } ?>>
				<div class="bg-content">
					<?php if(!isset($messages)) $messages = ''; echo $messages; ?>
				
					<?php if ($page['left']){ ?>
					    <div class="site-left">
							<?php echo render($page['left']); ?>
						</div>
					<?php } ?>
				
				    <div <?php if ($page['left']){ ?>class="site-content"<?php }else{ ?>class="site-center"<?php } ?>>
						<?php if ($page['content']){ ?>
							<?php unset($page['content']['system_main']['default_message']); ?>
				    		<?php echo render($page['content']); ?>
						<?php } ?>
					</div>
				
					<?php if ($page['right']){ ?>
					<div class="site-right">
						<?php echo render($page['right']); ?>
					</div>
					<?php } ?>
				</div>	
			</div>
		</div>	
	</div>
	<?php if ($page['footer']){ ?>
	    <div id="footer">
			<?php echo render($page['footer']); ?>
		</div>
	<?php } ?>
</div>